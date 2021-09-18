.class Lynh/httpserver/MyServer$2;
.super Ljava/lang/Object;
.source "MyServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lynh/httpserver/MyServer;->runServer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lynh/httpserver/MyServer;

.field final synthetic val$client:Ljava/net/Socket;


# direct methods
.method constructor <init>(Lynh/httpserver/MyServer;Ljava/net/Socket;)V
    .registers 3
    .param p1, "this$0"    # Lynh/httpserver/MyServer;

    .prologue
    .line 31
    iput-object p1, p0, Lynh/httpserver/MyServer$2;->this$0:Lynh/httpserver/MyServer;

    iput-object p2, p0, Lynh/httpserver/MyServer$2;->val$client:Ljava/net/Socket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 35
    :try_start_0
    iget-object v0, p0, Lynh/httpserver/MyServer$2;->this$0:Lynh/httpserver/MyServer;

    iget-object v1, p0, Lynh/httpserver/MyServer$2;->val$client:Ljava/net/Socket;

    invoke-virtual {v0, v1}, Lynh/httpserver/MyServer;->handle(Ljava/net/Socket;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_7} :catch_8

    .line 37
    :goto_7
    return-void

    .line 36
    :catch_8
    move-exception v0

    goto :goto_7
.end method
