import firebase_admin
from firebase_admin import credentials, firestore
import json
import os
import sys

# Đường dẫn đến tệp service account key của bạn
cred = credentials.Certificate(r'D:\Project_DNT\serviceKey\korastudy-9b3d5-firebase-adminsdk-7k30v-25f2e9f860.json')

# Khởi tạo Firebase Admin SDK
firebase_admin.initialize_app(cred)

# Lấy đối tượng Firestore
db = firestore.client()

# Đường dẫn đến tệp JSON
json_path = r'd:\Project_DNT\Korastudy_FE\korastudy_fe\assets\test_data\test1.json'

# Kiểm tra xem tệp JSON có tồn tại không
if not os.path.exists(json_path):
    print(f"File not found: {json_path}")
    exit(1)

# Đọc tệp JSON
with open(json_path, 'r', encoding='utf-8') as file:
    data = json.load(file)

# In dữ liệu ra console với bộ mã hóa UTF-8
sys.stdout.reconfigure(encoding='utf-8')
print(data)

# Lấy tham chiếu đến collection testpage
testpage_ref = db.collection('testpage')

# Duyệt qua các bài kiểm tra trong tệp JSON
for test_id, test_data in data['testpage'].items():
    # Lấy tham chiếu đến document của bài kiểm tra
    test_ref = testpage_ref.document(test_id)
    
    # Lấy danh sách câu hỏi
    questions = test_data.pop('questions')
    
    # Thêm bài kiểm tra vào Firestore
    test_ref.set(test_data)
    
    # Thêm các câu hỏi vào subcollection 'questions'
    questions_ref = test_ref.collection('questions')
    for question_id, question_data in questions.items():
        questions_ref.document(question_id).set(question_data)

print("Data imported successfully.")