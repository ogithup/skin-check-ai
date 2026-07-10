def test_register_and_login_flow(client):
    register = client.post(
        "/auth/register",
        json={"email": "user@example.com", "password": "password123"},
    )
    assert register.status_code == 201
    assert register.json()["token_type"] == "bearer"

    login = client.post(
        "/auth/login",
        json={"email": "user@example.com", "password": "password123"},
    )
    assert login.status_code == 200
    token = login.json()["access_token"]
    assert token

    me = client.get("/users/me", headers={"Authorization": f"Bearer {token}"})
    assert me.status_code == 200
    assert me.json()["email"] == "user@example.com"


def test_update_profile(client):
    register = client.post(
        "/auth/register",
        json={"email": "profile@example.com", "password": "password123"},
    )
    token = register.json()["access_token"]

    update = client.put(
        "/users/profile",
        headers={"Authorization": f"Bearer {token}"},
        json={"display_name": "Oğuz", "skin_type": "Combination", "beauty_goal": "Routine consistency"},
    )
    assert update.status_code == 200
    body = update.json()
    assert body["profile"]["display_name"] == "Oğuz"
    assert body["profile"]["skin_type"] == "Combination"
