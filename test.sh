if [ "$(grep -c 'Error' kk.txt)" = 1 && "$(grep -o 'failed to update OAuth application: the API returned an error: Api validation failed: tokenAuthMethod. Causes: errorSummary: tokenAuthMethod: The field has an invalid value' kk.txt)" = "failed to update OAuth application: the API returned an error: Api validation failed: tokenAuthMethod. Causes: errorSummary: tokenAuthMethod: The field has an invalid value' kk.txt)" ]; then
    # if [ "$(grep 'Error' kk.txt)" = "failed to update OAuth application: the API returned an error: Api validation failed: tokenAuthMethod. Causes: errorSummary: tokenAuthMethod: The field has an invalid value" ];then
        echo xDDD
    # fi
fi