return {
    cmd = {
        "java"
    },
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-25",
                        path = "~/.local/java/jdk/Contents/Home",
                        default = false,
                    }
                }
            }
        }
    }
}
