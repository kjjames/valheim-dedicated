variable "tags" {
    type = map
    description = "Map of tags to assign to the bucket."
    default = {
        terraform = true,
        valheim = true
    }
}