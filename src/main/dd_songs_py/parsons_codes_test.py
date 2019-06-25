import unittest

from dd_songs_py import parsons_codes

class Test(unittest.TestCase):


    def test_parson1(self):
        tris_kalnini=['fis', 'e', 'e', 'd', 'd', 'fis', 'd', 'e', 'fis', 'e', 'd', 'e', 'fis']
        result = parsons_codes.get_code(tris_kalnini)
        self.assertEqual(result[0:13], "*DRDRUDUUDDUUDDUUDURUDD"[0:13], "Did not match")
    

if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()