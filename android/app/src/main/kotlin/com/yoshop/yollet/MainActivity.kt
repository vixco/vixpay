package com.yoshop.yollet

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.KeyEvent
import androidx.annotation.NonNull

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        // K9 장치에서 flutter 1.17.3 이후 HOME 키가 시스템으로 전달이 되지 않아 홈 화면으로 나갈 수 없음
        // 방어코드로 직접 홈 화면을 호출하도록 함
        // 화면이 꺼진 상태에서는 key up 이벤트만, 켜진 상태에서는 key up/down 이벤트가 모두 올라옴
        // 화면이 켜진 상태에서만 home 키가 반응하도록 함
        if (Build.VERSION.SDK_INT == Build.VERSION_CODES.LOLLIPOP ||
                Build.VERSION.SDK_INT == Build.VERSION_CODES.LOLLIPOP_MR1) {
            if (keyCode == KeyEvent.KEYCODE_HOME) {
                Log.d("MainActivity", "HOME key is pressed, so go to home")
                val intent = Intent(Intent.ACTION_MAIN)
                intent.addCategory(Intent.CATEGORY_HOME)
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                startActivity(intent)
                return true
            }
        }

        return super.onKeyDown(keyCode, event)
    }

    private val CHANNEL = "com.yoshop.vixpay/channel"
    private var startString: String? = null
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "reward") {
                if (startString != null) {
                    result.success(startString)
                }
            }
        }
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val intent = getIntent()
        startString = intent.data?.toString()
    }
}
