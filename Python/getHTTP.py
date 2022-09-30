# import tornado libraries
import tornado.web
import tornado.ioloop

class basicRequestHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, World! This is a test")

if __name__ == "__main__":
    app = tornado.web.Application ( [
        (r"/", basicRequestHandler)
    ])
    port = 8882
    app.listen(port)
    print(f"Application is ready and listening on {port}")  # let us know the application is listening on the port
    tornado.ioloop.IOLoop.current().start()                 # a loop to keep listening on the port
