resource "aws_iam_user" "lb" {
  for_each = toset(["Jenny", "Jisoo", "Lisa", "Rose", "Jenny", "Lisa"])
  name     = each.value
}

# set - unique values

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    for i in aws_iam_user.lb : i.name
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "blackpink"
}

resource "aws_iam_user" "manual" {
  name = "hello"
}

# COMMANDS
# terraform validate

# terraform fmt

# terraform state list

# terraform state show FILENAME (aws_key_pair)

# terraform import aws_iam_user.manual hello