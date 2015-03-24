package models

import org.joda.time.{DateTimeZone, DateTime}
import org.joda.time.format.ISODateTimeFormat
import play.api.libs.json._
import reactivemongo.bson.{BSONHandler, BSONDateTime, BSONObjectID, Macros}
import play.modules.reactivemongo.json.BSONFormats._

case class User ( firstName: String,
                  lastName: String,
                  phone: String,
                  email: String,
                  facebook: Option[String],
                  twitter: Option[String],
                  google: Option[String],
                  textAlert: Boolean,
                  emailAlert: Boolean,
                  active: Boolean,
                  points: Option[Int],
                  lastVisit: Option[BSONDateTime])

object User{

  implicit val format = Json.format[User]
}
