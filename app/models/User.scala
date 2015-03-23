package models

import play.api.libs.json.Json
import reactivemongo.bson.BSONObjectID

case class User ( firstName: String,
                  lastName: String)

object User{
  implicit val format = Json.format[User]
}
