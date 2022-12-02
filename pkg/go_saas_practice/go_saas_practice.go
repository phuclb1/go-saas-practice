package go_saas_practice

import (
	"github.com/phuclb1/go_saas_practice/configs"
)

type Arguments struct {
	DelayOpt  int
	OutputOpt string
	EnvOpt    string
	ProxyOpt  string
}

func Run(args *Arguments) {
	configs.InitHttpClient(args.ProxyOpt)
}
