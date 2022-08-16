
package com.appwidgetflutter

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import com.starmarketing.attendencesystem.MainActivity
import com.starmarketing.attendencesystem.R
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

class AppWidgetProvider2 : HomeWidgetProvider() {
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.widget_layout).apply {

                // Open App on Widget Click
                val pendingIntent = HomeWidgetLaunchIntent.getActivity(context,
                    MainActivity::class.java)
                setOnClickPendingIntent(R.id.checkpoint, pendingIntent)

//                val clockin = widgetData.getString("clockin", "00:00")
//                val clockout = widgetData.getString("clockout", "00:00")
//
//                var clockinText = "$clockin"
//                var clockoutText = "$clockout"
//
////                if (clockin == "00:00") {
////                    clockinText = "00:00"
////                }
//
//                setTextViewText(R.id.clockin, clockinText)
//                setTextViewText(R.id.clockout, clockoutText)

                // Pending intent to update counter on button click
                val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                    Uri.parse("myAppWidget://updatecounter"))
//                setOnClickPendingIntent(R.id.bt_update, backgroundIntent)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
