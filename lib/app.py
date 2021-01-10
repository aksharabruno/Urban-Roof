import sqlite3
from flask import Flask 
from flask_sqlalchemy import SQLAlchemy
from io import BytesIO, StringIO
import json
from flask import request
from flask import jsonify
import base64
from werkzeug.utils import secure_filename 
#from models import Img
app = Flask(__name__)
DATABASE ='C:/sqlite/urbanroof.db'
def get_db():
    db = getattr(Flask, '_database', None)
    if db is None:
        db = Flask._database = sqlite3.connect(DATABASE)
    print("db",db)
    return db

@app.route('/',methods=['GET'])
def index():
    return "Hello world !"

@app.route('/login',methods=['POST'])

def login():
    data = request.json
    print(data)
    cur = get_db().cursor()
    c = cur.execute("SELECT * from login where username = (?) and password = (?)", [data['username'],data['password']])
    profile = c.fetchall()
    
    if profile == None :
        return "profile not found"
    list_profile = []
    for i in profile:
     
      Name = i[3]
      Address = i[4]
      Mobile_no = i[5]
      UserId = i[0]
      Age = i[6]
      username = i[1]
      #writeTofile(photo, "/home/hp/project/app.jpg")
      list_profile.append({"Name":Name,"Address":Address,"Mobile_no":Mobile_no,"UserId":UserId,"Age":Age,"username":username})
    
    return jsonify(list_profile)
    
@app.route('/signup',methods=['POST'])
def signup():
    try:
        data= request.json
        cur = get_db().cursor()
        c = cur.execute("INSERT INTO login (Name,Address,Mobile_no,Age,Username,Password) VALUES (?,?,?,?,?,?)",(data['Name'],data['Address'],data['Mobile Number'],data['Age'],data['Username'],data['Password']) )
        get_db().commit()
        return 'success'   
    except:
         get_db().rollback()
         return "error in insert operation"

# @app.route('/add_sell',methods=['POST'])
# def add_new_sell_product():
#     try:
#         data= request.json
#         cur = get_db().cursor()
#         c = cur.execute("INSERT INTO sell_product (Category,ProName,Quantity,Price,UserId) VALUES (?,?,?,?,?)",(data['Category'],data['ProName'],data['Quantity'],data['Price'],data['UserId']) )
#         get_db().commit()
#         return 'success'   
#     except:
#          get_db().rollback()
#          return "error in insert operation"

@app.route('/upload',methods=['POST'])
def upload():
    print(request.files)
    print(type(request.values['json']))
    data = request.values['json']
    data_values = json.loads(data)
    Category = data_values['Category']
    ProName = data_values['ProName']
    Quantity = data_values['Quantity']
    Price = data_values['Price']
    UserId = data_values['UserId']
    if 'file' not in request.files:
        return "file not found"
    pic = request.files['file'] 
    pics = sqlite3.Binary(pic.read())
    
    insertBLOB(pics,Category,ProName,Quantity,Price,UserId)
    return ("Image and file inserted successfully as a BLOB into a table")

   

def insertBLOB(pic,Category,ProName,Quantity,Price,UserId):
    try:
        cur = get_db().cursor()
        sqlite_insert_blob_query = """ INSERT INTO sell_product
                                (Category,ProName,Quantity,Price,UserId,photo) VALUES (?, ?, ?, ?, ?, ?)"""

        data_tuple = (Category,ProName,Quantity,Price,UserId,pic)
        cur.execute(sqlite_insert_blob_query, data_tuple)

        get_db().commit()
        cur.close()
        return("Image and file inserted successfully as a BLOB into a table")

    except :
        return("Failed to insert blob data into sqlite table")
        

@app.route('/all_produce',methods=['POST'])
def display_all_personal_product():

    data= request.json
    cur = get_db().cursor()
    c = cur.execute("SELECT * from sell_product where UserId= (?)", [data['UserId']])
    product = c.fetchall()
    
    if product == None :
        return "product not found"
    list_product = []
    for i in product:
     
      Category = i[0]
      ProName = i[1]
      Quantity = i[2]
      UserId = i[3]
      Price = i[4]
      photo = i[5]
      #writeTofile(photo, "/home/hp/project/app.jpg")
      list_product.append({"Category":Category,"ProName":ProName,"Quantity":Quantity,"UserId":UserId,"Price":Price,"photo":base64.b64encode(photo)})
    
    return jsonify(list_product)

def writeTofile(data, filename):
    # Convert binary data to proper format and write it on Hard Disk
    with open(filename, 'wb') as file:
        file.write(data)
    print("Stored blob data into: ", filename, "\n")
    return "OK"

@app.route('/buy_category',methods=['POST'])
def buy_category():
    data= request.json
    cur = get_db().cursor()
    c = cur.execute("SELECT * from sell_product where Category= (?)", [data['Category']])
    product = c.fetchall()
    
    if product == None :
        return "product not found"
    list_product = []
    for i in product:
      
      Category = i[0]
      ProName = i[1]
      Quantity = i[2]
      Price = i[3]
      UserId = i[4]
      photo = i[5]
      d = cur.execute("SELECT * from login where UserId= (?)", [UserId])
      print("userid:",UserId)
      details = d.fetchone()
      print(details)
      
      
      Address = details[4]
      Mobile_no = details[5]
          

      #writeTofile(photo, "/home/hp/project/app.jpg")
      list_product.append({"Category":Category,"ProName":ProName,"Quantity":Quantity,"Price":Price,"Address":Address,"Mobile_no":Mobile_no,"photo":base64.b64encode(photo)})
    
    return jsonify(list_product)
    # data= request.json
    # cur = get_db().cursor()
    # c = cur.execute("SELECT ProName,Quantity,Price from sell_product where Category= (?)", [data['Category']])
    # product = c.fetchone()
    # print(product)
    # if product == None :
    #     return "product not found"
    # list_product = []
    # for i in range(3):
    #   list_product.append(product[i])
    # print("fdjehjf",list_product)
    # # allproduct = [product[0],product[1],product[2],product[3],product[4] ]# or whatever the index position is
    # return jsonify(list_product)

@app.route('/edit_profile',methods=['POST'])
def edit_profile():

    data= request.json
    Address = data['Address']
    Mobile_no = data['Mobile_no'] 
    UserId = data['UserId'] 
    #print(UserId)
    update(Address,Mobile_no,UserId)
    return("updated successfully")
   


def update(Address,Mobile_no,UserId):

    cur = get_db().cursor()

    sql = """UPDATE login SET Address = (?), Mobile_no = (?) WHERE UserId = (?)"""
    
    data_tuple=(Address,Mobile_no,UserId)
    
    cur.execute(sql,data_tuple)

    
    get_db().commit()
    cur.close()
           
    return("updated successfully")

@app.route('/cart_dec',methods=['POST'])
def cart_dec():
    data= request.json
    print(len(data))
    for i in range(len(data)) :
        print(data[i])
        Quantity = data[i]['Quantity']
        print(Quantity)
        Category = data[i]['Category'] 
        UserId = data[i]['UserId'] 
        ProName = data[i]['ProName'] 
        update_cart(Quantity,ProName,Category,UserId)
    return("updated successfully")
   


def update_cart(Quantity,ProName,Category,UserId):

    cur = get_db().cursor()

    sql = """UPDATE sell_product SET Quantity = Quantity-(?) WHERE UserId = (?) and ProName = (?) and Category = (?)"""
    
    data_tuple=(Quantity,UserId,ProName,Category)
    
    cur.execute(sql,data_tuple)

    
    get_db().commit()
    cur.close()
           
    return("updated successfully")


if __name__=="__main__":   
    app.run(debug=True)
