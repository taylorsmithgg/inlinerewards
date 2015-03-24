import play.PlayImport.PlayKeys
import play.PlayScala
import sbt._
import Keys._

object ApplicationBuild extends Build {

  val appName         = "integrate"
  val appVersion      = "2.1-SNAPSHOT"


  fork := false

  val ivyLocal = Seq(
    Resolver.file("local Ivy", file(Path.userHome.absolutePath + "/.ivy2/local"))(Resolver.ivyStylePatterns)
  )

  val sonatypeRepo = Seq(
    "Sonatype Snapshots" at "http://oss.sonatype.org/content/repositories/snapshots/",
    "Reactive Mongo" at "https://oss.sonatype.org/content/repositories/snapshots/org/reactivemongo/play2-reactivemongo_2.11/0.10.5.akka23-SNAPSHOT/",
    "Typesafe repository" at "https://repo.typesafe.com/typesafe/releases/"
  )
  val appDependencies = Seq()

  val main = Project(appName, file(".")).enablePlugins(PlayScala).settings(
    version := appVersion,
    scalaVersion := "2.11.4",
    resolvers ++= sonatypeRepo ++ ivyLocal,
    libraryDependencies ++= Seq(
      "org.reactivemongo" %% "reactivemongo"       % "0.10.5.0.akka23",
      "play-autosource"   %% "reactivemongo"       % "2.1-SNAPSHOT",
      "com.google.inject" % "guice" % "3.0",
      "javax.inject" % "javax.inject" % "1",
      "org.webjars" % "bootstrap" % "3.3.1",
      "org.webjars" % "angularjs" % "1.3.8",
      "org.webjars" % "angular-ui-bootstrap" % "0.12.0",
      "junit"              % "junit"               % "4.8"         % "test"
    )

  )

}
