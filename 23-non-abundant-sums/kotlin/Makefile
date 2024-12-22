
OUT=out.jar

$(OUT): *.kt
	kotlinc -d $(OUT) -include-runtime *.kt

run:
	java -jar $(OUT)

