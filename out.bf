A Minecraft server in MetaBrainFuck





Return semantics
Cell 0: sockfd

Create a socket
===========================
    +++++++++++++++++++++++++++++++++++++++++ > System call code 41: socket()
    +++  > Arg count: 3

    Arg 1: int domain
          > Type
        +  > Len
        ++  > Value (AF_INET)

    Arg 2: int type
          > Type
        +  > Len
        +  > Value (SOCK_STREAM)

    Arg 3: int protocol
          > Type
        +  > Len
          > Value (default protocol)

    <<<<<<<<<<<
    %

    Call semantics
Cell 0: value

Exit if value is 255
===========================
    >[-]>[-]<<[->+>+<<]>>[-<<+>>]< copy value
    + >+<[[-]>-<]>[<+>-]< not value
    [
        -
        >[-]>[-]>[-]>[-]>[-]
        <<<<<
        Call semantics
Cell 0: status

Exit with status status
===========================
    [->>>>+<<<<] move status

    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ > System call code 60: exit()
    +  > Arg count

    Arg 1: int status
               > Type
        +       > Len
        (status) > Value

    <<<<<
    %
===========================

    ]
    <
===========================


    >[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]
    <<<<<<<<<<
===========================
Cell 0: sockfd (current)

Call semantics
Cell 0: sockfd

Return semantics
Cell 0: sockfd

Bind the socket
===========================
    [->>>>+<<<<] move sockfd

    +++++++++++++++++++++++++++++++++++++++++++++++++ > System call code 49: bind()
    +++  > Arg count: 3

    Arg 1: int sockfd
               > Type
        +       > Length
        (sockfd) > Value

    Arg 2: const struct sockaddr *addr
        +   > Type
        ++++++++++++++++  > Length

        Value
        ++   > sin_family
           >
        +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  > sin_port
        +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ >
           > sin_addr
           >
           >
           >
        ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ > sin_zero
           >
           >
           >
           >
           >
           >
           >

    Arg 3: socklen_t addrlen
          > Type
        +  > Length
        ++++++++++++++++ > Value

    <<<<<<<<<<<<<<<<<<<<<<<<<<
    %

    Call semantics
Cell 0: value

Exit if value is 255
===========================
    >[-]>[-]<<[->+>+<<]>>[-<<+>>]< copy value
    + >+<[[-]>-<]>[<+>-]< not value
    [
        -
        >[-]>[-]>[-]>[-]>[-]
        <<<<<
        Call semantics
Cell 0: status

Exit with status status
===========================
    [->>>>+<<<<] move status

    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ > System call code 60: exit()
    +  > Arg count

    Arg 1: int status
               > Type
        +       > Len
        (status) > Value

    <<<<<
    %
===========================

    ]
    <
===========================


    >>>>[-<<<<+>>>>]<<<< move sockfd

    >[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]
    <<<<<<<<<<<<<<<<<<<<<<<<<
===========================
Listen for connections
===========================
    [->>>>+<<<<] move sockfd

    ++++++++++++++++++++++++++++++++++++++++++++++++++ > System call code 50: listen()
    ++  > Arg count: 2

    Arg 1: int sockfd
               > Type
        +       > Length
        (sockfd) > Value

    Arg 2: int backlog
          > Type
        +  > Length
        +  > Value

    <<<<<<<<
    %

    Call semantics
Cell 0: value

Exit if value is 255
===========================
    >[-]>[-]<<[->+>+<<]>>[-<<+>>]< copy value
    + >+<[[-]>-<]>[<+>-]< not value
    [
        -
        >[-]>[-]>[-]>[-]>[-]
        <<<<<
        Call semantics
Cell 0: status

Exit with status status
===========================
    [->>>>+<<<<] move status

    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ > System call code 60: exit()
    +  > Arg count

    Arg 1: int status
               > Type
        +       > Len
        (status) > Value

    <<<<<
    %
===========================

    ]
    <
===========================


    >>>>[-<<<<+>>>>]<<<< move sockfd

    >[-]>[-]>[-]>[-]>[-]>[-]>[-]
    <<<<<<<
===========================

[->+<] move sockfd

Loop infinitely
+
[
    >

    Call semantics
Cell 0: sockfd

Return semantics
Cell 0: sockfd
Cell 1: connfd

Accept a connection
===========================
    [->>>>+<<<<] move sockfd

    +++++++++++++++++++++++++++++++++++++++++++ > System call code 43: accept()
    +++  > Arg count: 3

    Arg 1: int sockfd
               > Type
        +       > Length
        (sockfd) > Value

    Arg 2: const struct sockaddr *addr
        +            > Type
        ++++++++++++++++           > Length
        >>>>>>>>>>>>>>> > Value

    Arg 3: socklen_t addrlen
          > Type
        +  > Length
        ++++++++++++++++ > Value

    <<<<<<<<<<<<<<<<<<<<<<<<<<
    %

    Call semantics
Cell 0: value

Exit if value is 255
===========================
    >[-]>[-]<<[->+>+<<]>>[-<<+>>]< copy value
    + >+<[[-]>-<]>[<+>-]< not value
    [
        -
        >[-]>[-]>[-]>[-]>[-]
        <<<<<
        Call semantics
Cell 0: status

Exit with status status
===========================
    [->>>>+<<<<] move status

    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ > System call code 60: exit()
    +  > Arg count

    Arg 1: int status
               > Type
        +       > Len
        (status) > Value

    <<<<<
    %
===========================

    ]
    <
===========================


    >[-]< [->+<] move connfd

    >>>>[-<<<<+>>>>]<<< move sockfd

    >[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]>[-]
    <<<<<<<<<<<<<<<<<<<<<<<<<<
===========================

    Cell 0: loop
    Cell 1: sockfd (current)
    Cell 2: connfd

    Read 1 byte from connection
    >>+<
    Call semantics
Cell 0: fd
Cell 1: count

Return semantics
Cell 0: fd
Cell 1: count or less
Cell 2 to (2 plus count or less): data
Cells (2 plus count or less) to 11 will contain junk

Read count bytes from fd
===========================
    Cell 0: fd (current)
    Cell 1: count
    Cell 2: 0
    Cell 3: 0
    Cell 4: 0

    [->>+>>>+<<<<<]>>[-<<+>>]<< copy fd
    >[->>>>>>>>>>+<<<<<<<<<<] move count

    Cell 0: fd
    Cell 1: 0 (current)
    Cell 2: 0
    Cell 3: 0
    Cell 4: 0
    Cell 5: fd
    Cell 6: 0
    Cell 7: 0
    Cell 8: 0
    Cell 9: 0
    Cell 10: 0
    Cell 11: count

      > System call code 0: read()
    +++  > Arg count

    Cell 0: fd
    Cell 1: 0
    Cell 2: 3
    Cell 3: 0 (current)
    Cell 4: 0
    Cell 5: fd
    Cell 6: 0
    Cell 7: 0
    Cell 8: 0
    Cell 9: 0
    Cell 10: 0
    Cell 11: count

    Arg 1: int fd
           > Type
        +   > Length
        (fd) > Value

    Cell 0: fd
    Cell 1: 0
    Cell 2: 3
    Cell 3: 0
    Cell 4: 1
    Cell 5: fd
    Cell 6: 0 (current)
    Cell 7: 0
    Cell 8: 0
    Cell 9: 0
    Cell 10: 0
    Cell 11: count

    Arg 2: char *buf
        ++ > Type
        + > Length
        ++ > Value

    Cell 0: fd
    Cell 1: 0
    Cell 2: 3
    Cell 3: 0
    Cell 4: 1
    Cell 5: fd
    Cell 6: 2
    Cell 7: 1
    Cell 8: 2
    Cell 9: 0 (current)
    Cell 10: 0
    Cell 11: count

    Arg 3: size_t count
              > Type
        +      > Length
        (count) > Value

    Cell 0: fd
    Cell 1: 0
    Cell 2: 3
    Cell 3: 0
    Cell 4: 1
    Cell 5: fd
    Cell 6: 2
    Cell 7: 1
    Cell 8: 2
    Cell 9: 0
    Cell 10: 1
    Cell 11: count
    cell 12: 0 (current)

    <<<<<<<<<<<;
    %

    Call semantics
Cell 0: value

Exit if value is 255
===========================
    >[-]>[-]<<[->+>+<<]>>[-<<+>>]< copy value
    + >+<[[-]>-<]>[<+>-]< not value
    [
        -
        >[-]>[-]>[-]>[-]>[-]
        <<<<<
        Call semantics
Cell 0: status

Exit with status status
===========================
    [->>>>+<<<<] move status

    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ > System call code 60: exit()
    +  > Arg count

    Arg 1: int status
               > Type
        +       > Len
        (status) > Value

    <<<<<
    %
===========================

    ]
    <
===========================

===========================
    >>.

    <
]

Call semantics
Cell 0: status

Exit with status status
===========================
    [->>>>+<<<<] move status

    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ > System call code 60: exit()
    +  > Arg count

    Arg 1: int status
               > Type
        +       > Len
        (status) > Value

    <<<<<
    %
===========================

