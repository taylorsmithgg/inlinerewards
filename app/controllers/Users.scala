package controllers

import models.User
import org.joda.time.format.ISODateTimeFormat
import org.joda.time.{DateTime, DateTimeZone}
import play.api._
import play.api.mvc._
import reactivemongo.bson.{BSONDateTime, BSONHandler}

// BORING IMPORTS
// Json
import play.api.libs.json._
import play.api.libs.functional.syntax._
// Reactive JSONCollection
import play.modules.reactivemongo.json.collection.JSONCollection
// Autosource
import play.autosource.reactivemongo._
// AutoSource is Async so imports Scala Future implicits
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.Play.current

// >>> THE IMPORTANT PART <<<
object Users extends ReactiveMongoAutoSourceController[User] {
  lazy val coll = db.collection[JSONCollection]("users")
}