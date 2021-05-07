import pyodbc
import time

class Sql_fuc(object):
    #数据库连接
    def DBlogin(self):
        Severid = self.SeverID.text()
        Dbname=self.DBname.text()
        UserID=self.Username.text()
        Pwd=self.pwd.text()
        self.cnxn =pyodbc.connect('DRIVER={SQL Server};SERVER=%s;DATABASE=%s;UID=%s;PWD=%s'%(Severid,Dbname,UserID,Pwd))
        self.cursor =self.cnxn.cursor()
        if self.cursor:
            self.textBrowser.clear()
            self.textBrowser.append('数据库连接成功！')
    #数据库连接关闭
    def DBclose(self):
        self.cnxn.close()
        self.cursor =self.cnxn.cursor()
        if self.cursor:
            self.textBrowser.clear()
            self.textBrowser.append('数据库连接关闭！')            
    #物料表查询
    def sql_selectMaterial(self):   
        self.cursor.execute("select * from 物料表")
        row =self.cursor.fetchall()
        str_print=str('  物料编号           ,  物料名             ,   规格               ,数量 , 仓库编号 \n',)
        if row:
            for i in row:
                str_print+=str(i)
                str_print+='\n'
        self.textBrowser.clear()
        self.textBrowser.append(str_print)
    #转仓表查询
    def sql_selectTurnhub(self):
        self.cursor.execute("select * from 转仓表")
        row =self.cursor.fetchall()
        str_print=str('  动作编号           ,  物料编号           ,  管理员编号          ,数量,入仓编号,出仓编号 \n',)
        if row:
            for i in row:
                str_print+=str(i)
                str_print+='\n'
        self.textBrowser.clear()
        self.textBrowser.append(str_print)
    #出入库表查询
    def sql_selectIOhub(self):
        self.cursor.execute("select * from 出入库表")
        row =self.cursor.fetchall()
        str_print=str('  动作编号           ,  物料编号           ,   管理员编号          ,仓库编号, 出入数量 \n',)
        if row:
            for i in row:
                str_print+=str(i)
                str_print+='\n'
        self.textBrowser.clear()
        self.textBrowser.append(str_print)
    #出入库表新增
    def sql_IOhubInput(self):
        info = self.TextInput.toPlainText()
        info=info.strip(',').split(',')
        actID=str(time.strftime("%Y%m%d%H%M%S", time.localtime()))
        if len(info)==4:
            self.cursor.execute("""
            insert into 出入库表
            values(?,?,?,?,?)""",actID,info[0],info[1],info[2],int(info[3])
            )
            self.cnxn.commit()
            self.textBrowser.clear()
            self.textBrowser.append('出入库表更新成功')
        else:
            self.textBrowser.clear()
            self.textBrowser.append('请正确输入物料编号,管理员编号,仓库编号,出入数量，注意逗号不能为中文字符')
    #转仓表新增
    def sql_TurnhubInput(self):
        info = self.TextInput.toPlainText()
        info=info.strip(',').split(',')
        actID=str(time.strftime("%Y%m%d%H%M%S", time.localtime()))
        if len(info)==5:
            self.cursor.execute("""
            insert into 转仓表
            values(?,?,?,?,?,?)""",actID,info[0],info[1],int(info[2]),info[3],info[4]
            )
            self.cnxn.commit()
            self.textBrowser.clear()
            self.textBrowser.append('转仓表更新成功')
        else:
            self.textBrowser.clear()
            self.textBrowser.append('请正确输入物料编号,管理员编号,数量,入仓编号,出仓编号，注意逗号不能为中文字符')
    #指定仓库库存查询
    def sql_HubnumberScl(self):
        info = self.TextInput.toPlainText()
        info=info.strip(',').split(',')
        self.cursor.execute("exec sc_num ?",info)
        row =self.cursor.fetchall()
        str_print=str('仓库编号, 物料名             , 库存数量 \n',)
        if row:
            for i in row:
                str_print+=str(i)
                str_print+='\n'
        self.textBrowser.clear()
        self.textBrowser.append(str_print)
    #指定时间段出入库查询
    def sql_TimenumberScl(self):
        info = self.TextInput.toPlainText()
        info=info.strip(',').split(',')
        self.cursor.execute("exec sc_timenum ?,?",info[0],info[1])
        row =self.cursor.fetchall()
        str_print=str('  动作编号           ,  物料编号       , 出入数量 ,仓库编号 ,物料名 \n',)
        if row:
            for i in row:
                str_print+=str(i)
                str_print+='\n'
        self.textBrowser.clear()
        self.textBrowser.append(str_print)