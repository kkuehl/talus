from pymongo import MongoClient

print 'Testing ability to connect to localhost:27017 with pymongo'
client = MongoClient('localhost:27017', connectTimeoutMS=5)
db = client.talus
collection=db.master
cursor = collection.find({})
for document in cursor:
      print(document)

client.close()
