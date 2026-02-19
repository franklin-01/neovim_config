return {
    cmd = {
        "java"
    },
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "~/.local/java/jdk",
                        default = false,
                    }
                }
            }
        }
    }
}
