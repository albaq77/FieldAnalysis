# FieldAnalysis - 逐个运行所有 test_suites 测试用例
# 用法: .\run_all.ps1                    # 全量运行（编译+插桩+运行+分析）
#       .\run_all.ps1 -AnalysisOnly      # 仅分析模式（只生成 gep_field_map.json + struct_layout.json）
#       .\run_all.ps1 -SkipExternalInput # 跳过需要外部输入文件的测试
#       .\run_all.ps1 -DryRun            # 试运行（仅打印命令不执行）

param(
    [switch]$AnalysisOnly,
    [switch]$SkipExternalInput,
    [switch]$DryRun
)

$ErrorActionPreference = "Continue"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$FADir = Resolve-Path "$ScriptDir\..\.."
$FA_RUNNER = Join-Path $FADir "tools\fa_runner.py"

# 所有测试套件（目录名,  描述,  是否需要外部输入,  是否跳过）
$TestSuites = @(
    @{Dir="atomic_lock";         Desc="atomic_lock";               NeedInput=$false; Skip=$false},
    @{Dir="boost_test";          Desc="boost_test spinlock_pool";   NeedInput=$false; Skip=$false},
    @{Dir="false";               Desc="false sharing benchmark";   NeedInput=$false; Skip=$false},
    @{Dir="histogram";           Desc="histogram";                  NeedInput=$true;  Skip=$false},
    @{Dir="histogram_input";     Desc="histogram_input";            NeedInput=$true;  Skip=$false},
    @{Dir="linear_regression";   Desc="linear_regression";          NeedInput=$true;  Skip=$false},
    @{Dir="locked";              Desc="locked";                     NeedInput=$false; Skip=$false},
    @{Dir="lockless";            Desc="lockless";                   NeedInput=$false; Skip=$false},
    @{Dir="lu_ncb";              Desc="lu_ncb";                     NeedInput=$false; Skip=$false},
    @{Dir="string_match";        Desc="string_match";               NeedInput=$true;  Skip=$false},
    @{Dir="tensor";              Desc="tensor";                     NeedInput=$false; Skip=$false},
    @{Dir="tmi_boost/ref_count"; Desc="tmi_boost/ref_count";        NeedInput=$false; Skip=$false},
    @{Dir="tmi_boost/spinlock";  Desc="tmi_boost/spinlock";         NeedInput=$false; Skip=$false}
)

if ($SkipExternalInput) {
    foreach ($t in $TestSuites) {
        if ($t.NeedInput) { $t.Skip = $true }
    }
}

# ---------- 统计 ----------
$Total   = 0
$Passed  = 0
$Failed  = 0
$Skipped = 0

# ---------- 选项 ----------
$ExtraArgs = ""
if ($AnalysisOnly) {
    $ExtraArgs = "--analysis-only"
    Write-Host ">>> 模式: Analysis-Only (仅生成 JSON)" -ForegroundColor Cyan
} else {
    Write-Host ">>> 模式: 全量运行 (编译 + 插桩 + 运行 + 分析)" -ForegroundColor Cyan
}
Write-Host ""

# ---------- 运行 ----------
foreach ($t in $TestSuites) {
    $Total++
    $ConfigPath = Join-Path $ScriptDir ($t.Dir) "fa_test.json"

    if (-not (Test-Path $ConfigPath)) {
        Write-Host "[$Total/$($TestSuites.Count)] ${($t.Desc)}: SKIPPED (无 fa_test.json)" -ForegroundColor Yellow
        $Skipped++
        continue
    }

    if ($t.Skip) {
        Write-Host "[$Total/$($TestSuites.Count)] ${($t.Desc)}: SKIPPED (需要外部输入文件)" -ForegroundColor Yellow
        $Skipped++
        continue
    }

    Write-Host "============================================================" -ForegroundColor Blue
    Write-Host "[$Total/$($TestSuites.Count)] Running: $($t.Desc)" -ForegroundColor Blue
    Write-Host "Config: $ConfigPath" -ForegroundColor Gray

    if ($DryRun) {
        $cmd = "python3 `"$FA_RUNNER`" --config `"$ConfigPath`" $ExtraArgs --dry-run"
        Write-Host "  > $cmd" -ForegroundColor Gray
        Write-Host "[$Total] $($t.Desc): DRYRUN  模拟执行完成" -ForegroundColor Green
        continue
    }

    try {
        $result = python3 "$FA_RUNNER" --config "$ConfigPath" $ExtraArgs.Split(" ") 2>&1
        $exitCode = $LASTEXITCODE

        if ($exitCode -eq 0) {
            Write-Host "[$Total] $($t.Desc): PASSED" -ForegroundColor Green
            $Passed++
        } else {
            Write-Host "[$Total] $($t.Desc): FAILED (exit=$exitCode)" -ForegroundColor Red
            Write-Host $result -ForegroundColor DarkRed
            $Failed++
        }
    } catch {
        Write-Host "[$Total] $($t.Desc): FAILED (exception)" -ForegroundColor Red
        Write-Host $_ -ForegroundColor DarkRed
        $Failed++
    }
    Write-Host ""
}

# ---------- 汇总 ----------
Write-Host "============================================================" -ForegroundColor Blue
Write-Host "                Test Suite 执行汇总" -ForegroundColor White
Write-Host "============================================================" -ForegroundColor Blue
Write-Host "总计:   $Total"   -ForegroundColor White
Write-Host "通过:   $Passed"  -ForegroundColor Green
Write-Host "失败:   $Failed"  -ForegroundColor Red
Write-Host "跳过:   $Skipped" -ForegroundColor Yellow