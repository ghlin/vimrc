


syntax match cppType      display "\w*_t\>"
syntax match cppType      display "\w*_s\>"
syntax match cppStatement display "\<debug_\w*"
syntax match cppStatement display "\<WTF\>"
syntax match cppType      display "\<attr_\w*"
syntax match cppType      display "\<attrctl_\w*"
syntax match cppDefine    display "\<PP_\w*"
syntax match cppDefine    display "\<pp_\w*"
syntax match cppStatement display "\<u_\w*"

syntax match cppStatement display "concept"
syntax match cppStatement display "requires"


