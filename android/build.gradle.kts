plugins {
    id("com.android.application") version "8.1.0" apply false // Kiểm tra phiên bản phù hợp
    id("org.jetbrains.kotlin.android") version "1.9.0" apply false // Kiểm tra phiên bản
    id("dev.flutter.flutter-gradle-plugin") version "1.0.0" apply false // Kiểm tra phiên bản
}

dependencies {
    classpath("com.google.gms:google-services:4.4.2")
}