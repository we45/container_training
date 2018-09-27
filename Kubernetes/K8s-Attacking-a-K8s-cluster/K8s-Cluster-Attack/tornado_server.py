#!/usr/bin/env python

import tornado.ioloop
import tornado.web
import pprint


class MyDumpHandler(tornado.web.RequestHandler):
    def post(self):
        pprint.pprint(self.request)
        pprint.pprint(self.request.body)

if __name__ == "__main__":
    tornado.web.Application([(r"/.*", MyDumpHandler),]).listen(9090)
    tornado.ioloop.IOLoop.instance().start()

