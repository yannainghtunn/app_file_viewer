.class final Lynh/httpserver/MyServer$1;
.super Ljava/lang/Object;
.source "MyServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lynh/httpserver/MyServer;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 19
    :try_start_0
    new-instance v0, Lynh/httpserver/MyServer;

    invoke-direct {v0}, Lynh/httpserver/MyServer;-><init>()V

    invoke-virtual {v0}, Lynh/httpserver/MyServer;->runServer()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_9

    .line 21
    :goto_8
    return-void

    .line 20
    :catch_9
    move-exception v0

    goto :goto_8
.end method
