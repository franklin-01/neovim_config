return {
    cmd = {
        "java"
    },
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "~/.local/java/jdk-17",
                        default = true,
                    }
                }
            }
        }
    }
}
