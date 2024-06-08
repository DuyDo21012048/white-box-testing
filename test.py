import unittest
from django.contrib.auth.models import User
from .models import ChatRoom, Message
from .views import send_message

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
