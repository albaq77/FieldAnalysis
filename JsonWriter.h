#ifndef FIELDANALYSIS_JSONWRITER_H
#define FIELDANALYSIS_JSONWRITER_H

#include "llvm/Support/raw_ostream.h"
#include <string>

namespace llvm {

inline std::string escapeJsonString(const std::string &S) {
  std::string Result;
  Result.reserve(S.size());
  for (char C : S) {
    switch (C) {
    case '"':  Result += "\\\""; break;
    case '\\': Result += "\\\\"; break;
    case '\b': Result += "\\b";  break;
    case '\f': Result += "\\f";  break;
    case '\n': Result += "\\n";  break;
    case '\r': Result += "\\r";  break;
    case '\t': Result += "\\t";  break;
    default:
      if (static_cast<unsigned char>(C) < 0x20) {
        raw_string_ostream RSOS(Result);
        RSOS << "\\u" << format_hex_no_prefix(static_cast<unsigned>(C), 4);
      } else {
        Result += C;
      }
      break;
    }
  }
  return Result;
}

class JsonWriter {
  raw_ostream &OS;
  int indent_level;
  bool need_comma;
  bool inline_value;

  void writeIndent() {
    for (int i = 0; i < indent_level; ++i)
      OS << "  ";
  }

public:
  explicit JsonWriter(raw_ostream &OS)
      : OS(OS), indent_level(0), need_comma(false), inline_value(false) {}

  void beginObject() {
    if (!inline_value) {
      if (need_comma)
        OS << ',';
      if (indent_level > 0)
        OS << '\n';
      writeIndent();
    }
    OS << '{';
    OS << '\n';
    indent_level++;
    need_comma = false;
    inline_value = false;
  }

  void endObject() {
    indent_level--;
    OS << '\n';
    writeIndent();
    OS << '}';
    need_comma = true;
    inline_value = false;
  }

  void beginArray() {
    if (!inline_value) {
      if (need_comma)
        OS << ',';
      if (indent_level > 0)
        OS << '\n';
      writeIndent();
    }
    OS << '[';
    OS << '\n';
    indent_level++;
    need_comma = false;
    inline_value = false;
  }

  void endArray() {
    indent_level--;
    OS << '\n';
    writeIndent();
    OS << ']';
    need_comma = true;
    inline_value = false;
  }

  JsonWriter &key(const std::string &name) {
    if (need_comma)
      OS << ',';
    OS << '\n';
    writeIndent();
    OS << '"' << escapeJsonString(name) << "\": ";
    need_comma = false;
    inline_value = true;
    return *this;
  }

  JsonWriter &value(const std::string &s) {
    if (!inline_value) {
      if (need_comma)
        OS << ',';
      OS << '\n';
      writeIndent();
    }
    OS << '"' << escapeJsonString(s) << '"';
    need_comma = true;
    inline_value = false;
    return *this;
  }

  JsonWriter &value(uint32_t v) {
    if (!inline_value) {
      if (need_comma)
        OS << ',';
      OS << '\n';
      writeIndent();
    }
    OS << v;
    need_comma = true;
    inline_value = false;
    return *this;
  }

  JsonWriter &value(uint64_t v) {
    if (!inline_value) {
      if (need_comma)
        OS << ',';
      OS << '\n';
      writeIndent();
    }
    OS << v;
    need_comma = true;
    inline_value = false;
    return *this;
  }

  JsonWriter &value(int v) {
    if (!inline_value) {
      if (need_comma)
        OS << ',';
      OS << '\n';
      writeIndent();
    }
    OS << v;
    need_comma = true;
    inline_value = false;
    return *this;
  }
};

} // namespace llvm

#endif
