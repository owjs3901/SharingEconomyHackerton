package com.sharingeconomy;

import android.app.Activity;
import android.graphics.Point;
import android.location.Location;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.PopupWindow;

public class HomeActivity extends AppCompatActivity {
    private Button btnExtra;
    private PopupWindow pwindow;
    final Point p = new Point();
    private int mWidthPixels, mHeightPixels;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        btnExtra = (Button) findViewById(R.id.btnExtra);
        btnExtra.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (p != null) {
                    showpopupwindows(HomeActivity.this, p);
                }
            }
        });
    }

        public void onWindowsFocusChanged(boolean hasFocus)
        {
          int location[] = new int [2];
          btnExtra.getLocationOnScreen(location);

          p.x = location[0];
          p.y = location[1];
        }

        private void showpopupwindows(final Activity context, Point p)
        {
            int popupwidth = 800;
            int popupheight = 1000;

            LinearLayout viewgroup = (LinearLayout)context.findViewById(R.id.popup_element);
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(context.LAYOUT_INFLATER_SERVICE);

            View layout = inflater.inflate(R.layout.extra_popup_window, viewgroup);

            final PopupWindow window = new PopupWindow(context);
            window.setContentView(layout);
            window.setWidth(popupwidth);
            window.setHeight(popupheight);
            window.setFocusable(true);

            int offset_x = 0;
            int offset_y = 300;

            window.showAtLocation(layout, Gravity.NO_GRAVITY, p.x+offset_x, p.y+offset_y);


        }
    }

