
.text:100000f20 <_main>:
                           .text:100000f20 55                               push   %rbp
                           .text:100000f21 48 89 e5                         mov    %rsp,%rbp
                           .text:100000f24 48 83 ec 20                      sub    $0x20,%rsp
                           .text:100000f28 c7 45 fc 00 00 00 00             movl   $0x0,-0x4(%rbp)
                           .text:100000f2f c7 45 e4 00 00 00 00             movl   $0x0,-0x1c(%rbp)
                           .text:100000f36 c7 45 e0 01 00 00 00             movl   $0x1,-0x20(%rbp)
                           .text:100000f3d c7 45 f8 00 04 00 00             movl   $0x400,-0x8(%rbp)
                           .text:100000f44 48 63 45 f8                      movslq -0x8(%rbp),%rax
                           .text:100000f48 48 c1 e0 00                      shl    $0x0,%rax
                           .text:100000f4c 48 89 c7                         mov    %rax,%rdi
                           .text:100000f4f e8 1c 00 00 00                   callq  0x100000f70
                           .text:100000f54 48 89 45 e8                      mov    %rax,-0x18(%rbp)
                           .text:100000f58 81 7d e0 01 00 00 00             cmpl   $0x1,-0x20(%rbp)
                           .text:100000f5f 0f 84 df ff ff ff                je     0x100000f44
                           .text:100000f65 b8 00 00 00 00                   mov    $0x0,%eax
                           .text:100000f6a 48 83 c4 20                      add    $0x20,%rsp
                           .text:100000f6e 5d                               pop    %rbp
                           .text:100000f6f c3                               retq   
                  __TEXT.__stubs:100000f70 ff 25 9a 00 00 00                jmpq   *0x9a(%rip)        # 0x100001010
            __TEXT.__stub_helper:100000f78 4c 8d 1d 89 00 00 00             lea    0x89(%rip),%r11        # 0x100001008
            __TEXT.__stub_helper:100000f7f 41 53                            push   %r11
            __TEXT.__stub_helper:100000f81 ff 25 79 00 00 00                jmpq   *0x79(%rip)        # 0x100001000
            __TEXT.__stub_helper:100000f87 90                               nop
            __TEXT.__stub_helper:100000f88 68 00 00 00 00                   pushq  $0x0
            __TEXT.__stub_helper:100000f8d e9 e6 ff ff ff                   jmpq   0x100000f78
            __TEXT.__unwind_info:100000f94 01 00                            add    %eax,(%rax)
            __TEXT.__unwind_info:100000f96 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000f98 1c 00                            sbb    $0x0,%al
            __TEXT.__unwind_info:100000f9a 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000f9c 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000f9e 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fa0 1c 00                            sbb    $0x0,%al
            __TEXT.__unwind_info:100000fa2 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fa4 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fa6 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fa8 1c 00                            sbb    $0x0,%al
            __TEXT.__unwind_info:100000faa 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fac 02 00                            add    (%rax),%al
            __TEXT.__unwind_info:100000fae 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fb0 20 0f                            and    %cl,(%rdi)
            __TEXT.__unwind_info:100000fb2 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fb4 34 00                            xor    $0x0,%al
            __TEXT.__unwind_info:100000fb6 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fb8 34 00                            xor    $0x0,%al
            __TEXT.__unwind_info:100000fba 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fbc 71 0f                            jno    0x100000fcd
            __TEXT.__unwind_info:100000fbe 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fc0 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fc2 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fc4 34 00                            xor    $0x0,%al
            __TEXT.__unwind_info:100000fc6 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fc8 03 00                            add    (%rax),%eax
            __TEXT.__unwind_info:100000fca 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fcc 0c 00                            or     $0x0,%al
            __TEXT.__unwind_info:100000fce 01 00                            add    %eax,(%rax)
            __TEXT.__unwind_info:100000fd0 10 00                            adc    %al,(%rax)
            __TEXT.__unwind_info:100000fd2 01 00                            add    %eax,(%rax)
            __TEXT.__unwind_info:100000fd4 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fd6 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fd8 00 00                            add    %al,(%rax)
            __TEXT.__unwind_info:100000fda 00 01                            add    %al,(%rcx)
                       .eh_frame:100000fe0 14                               0x14 
                       .eh_frame:100000fe1 00                               0x00 
                       .eh_frame:100000fe2 00                               0x00 
                       .eh_frame:100000fe3 00                               0x00 
                       .eh_frame:100000fe4 00                               0x00 
                       .eh_frame:100000fe5 00                               0x00 
                       .eh_frame:100000fe6 00                               0x00 
                       .eh_frame:100000fe7 00                               0x00 
                       .eh_frame:100000fe8 01                               0x01 
                       .eh_frame:100000fe9 7a                               0x7a 'z'
                       .eh_frame:100000fea 52                               0x52 'R'
                       .eh_frame:100000feb 00                               0x00 
                       .eh_frame:100000fec 01                               0x01 
                       .eh_frame:100000fed 78                               0x78 'x'
                       .eh_frame:100000fee 10                               0x10 
                       .eh_frame:100000fef 01                               0x01 
                       .eh_frame:100000ff0 10                               0x10 
                       .eh_frame:100000ff1 0c                               0x0c ''
                       .eh_frame:100000ff2 07                               0x07 
                       .eh_frame:100000ff3 08                               0x08 
                       .eh_frame:100000ff4 90                               0x90 
                       .eh_frame:100000ff5 01                               0x01 
                       .eh_frame:100000ff6 00                               0x00 
                       .eh_frame:100000ff7 00                               0x00 
          __DATA.__nl_symbol_ptr:100001000 00                               0x00 
          __DATA.__nl_symbol_ptr:100001001 00                               0x00 
          __DATA.__nl_symbol_ptr:100001002 00                               0x00 
          __DATA.__nl_symbol_ptr:100001003 00                               0x00 
          __DATA.__nl_symbol_ptr:100001004 00                               0x00 
          __DATA.__nl_symbol_ptr:100001005 00                               0x00 
          __DATA.__nl_symbol_ptr:100001006 00                               0x00 
          __DATA.__nl_symbol_ptr:100001007 00                               0x00 
          __DATA.__nl_symbol_ptr:100001008 00                               0x00 
          __DATA.__nl_symbol_ptr:100001009 00                               0x00 
          __DATA.__nl_symbol_ptr:10000100a 00                               0x00 
          __DATA.__nl_symbol_ptr:10000100b 00                               0x00 
          __DATA.__nl_symbol_ptr:10000100c 00                               0x00 
          __DATA.__nl_symbol_ptr:10000100d 00                               0x00 
          __DATA.__nl_symbol_ptr:10000100e 00                               0x00 
          __DATA.__nl_symbol_ptr:10000100f 00                               0x00 
          __DATA.__la_symbol_ptr:100001010 88                               0x88 
          __DATA.__la_symbol_ptr:100001011 0f                               0x0f 
          __DATA.__la_symbol_ptr:100001012 00                               0x00 
          __DATA.__la_symbol_ptr:100001013 00                               0x00 
          __DATA.__la_symbol_ptr:100001014 01                               0x01 
          __DATA.__la_symbol_ptr:100001015 00                               0x00 
          __DATA.__la_symbol_ptr:100001016 00                               0x00 
          __DATA.__la_symbol_ptr:100001017 00                               0x00 
