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
                        path = "~/.local/java/jdk-17",
                        default = false,
                    }
                }
            }
        }
    }
}
