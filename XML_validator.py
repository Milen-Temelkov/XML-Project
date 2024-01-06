from lxml import etree
from sys import argv

xml_filename = argv[1]
schema_filename = argv[2]

try:
    xml = etree.parse(xml_filename)
    schema = etree.XMLSchema(file=schema_filename)

    if schema.validate(xml):
        print("XML документът е валиден спрямо XML схемата.")
    else:
        print("XML документът не е валиден спрямо XML схемата.")

except etree.XMLSyntaxError as e:
    print(f"Грешка в синтаксиса на XML документа: {e}")

except etree.DocumentInvalid as e:
    print(f"Грешка при валидацията на XML документа: {e}")

except Exception as e:
    print(f"Обща грешка: {e}")