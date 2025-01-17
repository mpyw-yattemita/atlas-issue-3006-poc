schema "app" {

}

table "users" {
  schema = schema.app
  column "id" {
    type = int
  }
  column "user_name" {
    type = text
  }
  column "email" {
    type = text
  }
  primary_key {
    columns = [column.id]
  }
  unique "users_email_key" {
    columns = [column.email]
  }
}

table "posts" {
  schema = schema.app
  column "id" {
    type = int
  }
  column "user_id" {
    type = int
  }
  column "title" {
    type = varchar(255)
  }
  column "body" {
    type = text
  }
  primary_key {
    columns = [column.id]
  }
  foreign_key "post_author" {
    columns = [column.user_id]
    ref_columns = [table.users.column.id]
    on_delete = CASCADE
    on_update = NO_ACTION
  }
  index "posts_user_id_key" {
    columns = [column.user_id]
  }
}
