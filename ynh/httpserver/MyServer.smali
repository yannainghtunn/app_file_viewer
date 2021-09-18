.class public Lynh/httpserver/MyServer;
.super Ljava/lang/Object;
.source "MyServer.java"


# static fields
.field public static final PATH:Ljava/lang/String; = "replace"

.field public static final PORT:I = 0x2382


# instance fields
.field server:Ljava/net/ServerSocket;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 1
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 99
    invoke-static {}, Lynh/httpserver/MyServer;->run()V

    .line 100
    return-void
.end method

.method public static run()V
    .registers 2

    .prologue
    .line 15
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lynh/httpserver/MyServer$1;

    invoke-direct {v1}, Lynh/httpserver/MyServer$1;-><init>()V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 22
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 23
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Server is Runnning.."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    return-void
.end method


# virtual methods
.method handle(Ljava/net/Socket;)V
    .registers 8
    .param p1, "client"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 48
    .local v1, "ins":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 49
    .local v0, "i":I
    const-string v2, ""

    .line 50
    .local v2, "str":Ljava/lang/String;
    :cond_7
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_4c

    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    int-to-char v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 52
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    int-to-char v4, v0

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->print(C)V

    .line 53
    const-string v3, "GET"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string v3, "HTTP/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 54
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    const/4 v4, 0x4

    const-string v5, "HTTP/"

    invoke-virtual {v2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lynh/httpserver/MyServer;->responsePath(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 58
    :cond_4c
    return-void
.end method

.method public responsePath(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 22
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 60
    new-instance v5, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "replace"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static/range {p2 .. p2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v5, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 61
    .local v5, "file":Ljava/io/File;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "DECODED: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v14

    if-nez v14, :cond_9f

    .line 63
    const-string v14, "HTTP/1.1 200 OK\r\n"

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    .line 65
    new-instance v13, Ljava/io/FileInputStream;

    invoke-direct {v13, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 66
    .local v13, "stream":Ljava/io/FileInputStream;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Content-Length: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v13}, Ljava/io/FileInputStream;->available()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    .line 67
    const-string v14, "\r\n"

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    .line 68
    const/16 v14, 0x4000

    new-array v2, v14, [B

    .line 70
    .local v2, "bytes":[B
    :goto_83
    invoke-virtual {v13, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .local v3, "count":I
    if-lez v3, :cond_90

    .line 71
    const/4 v14, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v14, v3}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_83

    .line 73
    :cond_90
    const-string v14, "\r\n\r\n"

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    .line 96
    .end local v2    # "bytes":[B
    .end local v3    # "count":I
    .end local v13    # "stream":Ljava/io/FileInputStream;
    :goto_9b
    invoke-virtual/range {p1 .. p1}, Ljava/io/OutputStream;->flush()V

    .line 97
    return-void

    .line 76
    :cond_9f
    :try_start_9f
    const-string v14, "HTTP/1.1 200 OK\r\n"

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    .line 77
    const-string v14, "Content-Type: text/html\r\n"

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    .line 78
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "<html><body><br/><h2><b>Path:</b> "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "</h2><ul>"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 79
    .local v11, "response_start":Ljava/lang/String;
    const-string v9, "</ul><hr size=\'2\'/><h4>Server is created by YNH</h4></body></html>"

    .line 80
    .local v9, "response_end":Ljava/lang/String;
    const-string v10, ""

    .line 81
    .local v10, "response_middle":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v15

    array-length v0, v15

    move/from16 v16, v0

    const/4 v14, 0x0

    :goto_dc
    move/from16 v0, v16

    if-ge v14, v0, :cond_155

    aget-object v12, v15, v14

    .line 82
    .local v12, "s":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    .line 83
    .local v7, "n":Ljava/lang/String;
    const-string v17, "/"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_107

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "/"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 84
    :cond_107
    const-string v6, ""

    .line 85
    .local v6, "m":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/io/File;->isDirectory()Z

    move-result v17

    if-eqz v17, :cond_111

    const-string v6, " <b>[Folder]</b>"

    .line 86
    :cond_111
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "<li><h4><a href=\'"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "\'>"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "</a>"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "</h4></li>"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 81
    add-int/lit8 v14, v14, 0x1

    goto :goto_dc

    .line 88
    .end local v6    # "m":Ljava/lang/String;
    .end local v7    # "n":Ljava/lang/String;
    .end local v12    # "s":Ljava/io/File;
    :cond_155
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 89
    .local v8, "res":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Content-Length: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    .line 90
    const-string v14, "\r\n"

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    .line 91
    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V
    :try_end_1a4
    .catch Ljava/lang/Exception; {:try_start_9f .. :try_end_1a4} :catch_1a6

    goto/16 :goto_9b

    .line 92
    .end local v8    # "res":Ljava/lang/String;
    .end local v9    # "response_end":Ljava/lang/String;
    .end local v10    # "response_middle":Ljava/lang/String;
    .end local v11    # "response_start":Ljava/lang/String;
    :catch_1a6
    move-exception v4

    .line 93
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/io/OutputStream;->write([B)V

    goto/16 :goto_9b
.end method

.method public runServer()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 27
    new-instance v2, Ljava/net/ServerSocket;

    const/16 v3, 0x2382

    invoke-direct {v2, v3}, Ljava/net/ServerSocket;-><init>(I)V

    iput-object v2, p0, Lynh/httpserver/MyServer;->server:Ljava/net/ServerSocket;

    .line 30
    :goto_9
    :try_start_9
    iget-object v2, p0, Lynh/httpserver/MyServer;->server:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 31
    .local v0, "client":Ljava/net/Socket;
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lynh/httpserver/MyServer$2;

    invoke-direct {v3, p0, v0}, Lynh/httpserver/MyServer$2;-><init>(Lynh/httpserver/MyServer;Ljava/net/Socket;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 38
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_1c} :catch_1d

    goto :goto_9

    .line 39
    .end local v0    # "client":Ljava/net/Socket;
    :catch_1d
    move-exception v1

    .line 40
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_9
.end method
