package com.example.moti_mobile
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("e044ea0d-b3bd-40f8-b1d2-8796494e5a8c") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}