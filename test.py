import unittest
from django.contrib.auth.models import User
from .models import ChatRoom, Message
from .views import send_message

class LoginTest(unittest.TestCase):

    def setUp(self):
        self.user = User.objects.create_user(username='user1', password='pass')

    def test_login_success(self):
        result = login('user1', 'pass')
        self.assertEqual(result, "Login successful")

    def test_login_missing_parameters(self):
        with self.assertRaises(ValueError):
            login('', 'pass')
        with self.assertRaises(ValueError):
            login('user1', '')

    def test_login_user_not_exist(self):
        with self.assertRaises(ValueError):
            login('nonexistent_user', 'pass')

    def test_login_invalid_password(self):
        with self.assertRaises(ValueError):
            login('user1', 'wrongpass')

    def test_login_disabled_user(self):
        self.user.is_active = False
        self.user.save()
        with self.assertRaises(PermissionError):
            login('user1', 'pass')

if __name__ == '__main__':
    unittest.main()

class SendMessageTest(unittest.TestCase):

    def setUp(self):
        self.user1 = User.objects.create_user(username='user1', password='pass')
        self.user2 = User.objects.create_user(username='user2', password='pass')
        self.room = ChatRoom.objects.create(name='Test Room')
        self.room.participants.set([self.user1, self.user2])

    def test_send_message_success(self):
        message = send_message(self.user1, self.room.id, "Hello")
        self.assertEqual(message.content, "Hello")
        self.assertEqual(message.sender, self.user1)
        self.assertEqual(message.room, self.room)

    def test_send_message_missing_parameters(self):
        with self.assertRaises(ValueError):
            send_message(self.user1, self.room.id, "")

    def test_send_message_user_not_in_room(self):
        user3 = User.objects.create_user(username='user3', password='pass')
        with self.assertRaises(PermissionError):
            send_message(user3, self.room.id, "Hello")
