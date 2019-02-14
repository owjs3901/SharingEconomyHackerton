package com.sharingeconomy;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class JoinActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_join);

        Button btnSubmit = (Button) findViewById(R.id.btnSubmit);
        Button btnCancel = (Button) findViewById(R.id.btnCancel);
        EditText editTextLoginPassword = (EditText) findViewById(R.id.editTextLoginPassword);
        EditText editTextEmailAddress = (EditText) findViewById(R.id.editTextEmailAddress);

        btnCancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intentCancel = new Intent(getApplicationContext(), LoginActivity.class);
                startActivity(intentCancel);
            }
        });

    }
}
