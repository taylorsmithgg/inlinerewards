package models

import play.api.libs.json.Json
import reactivemongo.bson.BSONObjectID

case class User ( firstName: String,
                  lastName: String,
                  phone: String,
                  email: String,
                  points: Option[Int],
                  lastVisit: Option[List[String]])

object User{
  implicit val format = Json.format[User]
}
