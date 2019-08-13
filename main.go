package main

import (
	"flag"
	"fmt"
	"github.com/aliyun/alibaba-cloud-sdk-go/services/alidns"
)

func main() {
	var action, regionId, accessKeyId, accessKeySecret, domain, rr, value, record string
	flag.StringVar(&action, "action", "", "create or delete")
	flag.StringVar(&regionId, "region", "", "regionId")
	flag.StringVar(&accessKeyId, "id", "", "accessKeyId")
	flag.StringVar(&accessKeySecret, "secret", "", "accessSecret")
	flag.StringVar(&domain, "domain", "", "create domain")
	flag.StringVar(&rr, "rr", "", "create RR")
	flag.StringVar(&value, "value", "", "create value")
	flag.StringVar(&record, "record", "", "delete recordId")
	flag.Parse()

	client, err := alidns.NewClientWithAccessKey(regionId, accessKeyId, accessKeySecret)
	if err != nil {
		fmt.Printf("fail:%s", err.Error())
		return
	}
	if action == "create" {
		request := alidns.CreateAddDomainRecordRequest()
		request.Scheme = "https"
		request.DomainName = domain
		request.RR = rr
		request.Type = "TXT"
		request.Value = value

		response, err := client.AddDomainRecord(request)
		if err != nil {
			fmt.Printf("fail:%s", err.Error())
			return
		}
		fmt.Printf("ok:%s", response.RecordId)
		return
	} else if action == "delete" {
		request := alidns.CreateDeleteDomainRecordRequest()
		request.RecordId = record

		_, err := client.DeleteDomainRecord(request)
		if err != nil {
			fmt.Printf("fail:%s", err.Error())
			return
		}
		fmt.Printf("ok")
		return
	}
	fmt.Printf("fail:unknow action")
}
