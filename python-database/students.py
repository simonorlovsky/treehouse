from peewee import *

db = SqliteDatabase('students.db')

class Student(Model):
	username = CharField(max_length=255, unique=True)
	points = IntegerField(default=0)

	class Meta:
		database = db

students = [
	{'username': 'simonorlovsky',
	'points': 4888},
	{'username': 'randytovar',
	'points': 4343}
]

def add_students():
	for student in students:
		try:
			Student.create(username=student['username'], points=student['points'])
		except IntegrityError:
			student_record = Student.get(username=student['username'])
			student_record.points = student['points']
			student_record.save()

def top_student():
	student = Student.select().order_by(Student.points.desc()).get()
	return student

if __name__ == '__main__':
	db.connect()
	db.create_tables([Student], safe=True)
	add_students()
	print "Our top student right now is %s" %(top_student().username)