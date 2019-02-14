package com.sharingeconomy;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class LoginActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        Button btnLogin = (Button) findViewById(R.id.btnLogIn);
        Button btnSignUp = (Button) findViewById(R.id.btnSignUp);
        EditText editTextLoginId = (EditText) findViewById(R.id.editTextLoginId);
        EditText editTextLoginPassword = (EditText) findViewById(R.id.editTextLoginPassword);

        btnSignUp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intentJoin = new Intent(getApplicationContext(), JoinActivity.class);
                startActivity(intentJoin);
            }
        });

    }
}
