#!/bin/bash

sed -i 's,http://blog\.uniqush\.org/theme,/theme,g' $(find output -iname '*.html')
