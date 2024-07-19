package resource

import (
	"embed"
	"os"
	"path/filepath"
	"strings"

	"github.com/alibaba/opentelemetry-go-auto-instrumentation/pkg"
	"github.com/alibaba/opentelemetry-go-auto-instrumentation/tool/util"

	"github.com/alibaba/opentelemetry-go-auto-instrumentation/api"
)

func listFiles(fs embed.FS, dir string) ([]string, error) {
	list, err := fs.ReadDir(dir)
	if err != nil {
		return nil, err
	}
	var files []string
	for _, item := range list {
		path := dir + "/" + item.Name()
		if item.IsDir() {
			subFiles, err := listFiles(fs, path)
			if err != nil {
				return nil, err
			}
			files = append(files, subFiles...)
		} else {
			files = append(files, path)
		}
	}
	return files, nil
}

func CopyPkgTo(target string) error {
	var files []string
	candidate := pkg.ExportPkgDirList()
	for _, dir := range candidate {
		subFiles, err := listFiles(pkg.ExportPkgFS(), dir)
		if err != nil {
			return err
		}
		files = append(files, subFiles...)
	}

	_ = os.MkdirAll(target, 0775)
	for _, file := range files {
		if strings.HasSuffix(file, "_test.go") {
			continue
		}
		t, err := pkg.ExportPkgFS().ReadFile(file)
		if err != nil {
			return err
		}
		target := filepath.Join(target, file)
		err = os.MkdirAll(filepath.Dir(target), os.ModePerm)
		if err != nil {
			return err
		}
		text := string(t)
		_, err = util.WriteStringToFile(target, text)
		if err != nil {
			return err
		}
	}
	return nil
}

func CopyOtelSetupTo(pkgName, target string) (string, error) {
	template := pkg.ExportOtelSetupSDKTemplate()
	snippet := strings.Replace(template, "package pkg", "package "+pkgName, 1)
	snippet = util.RemoveGoBuildComment(snippet)
	return util.WriteStringToFile(target, snippet)
}

func CopyAPITo(target string, pkgName string) (string, error) {
	apiSnippet := strings.Replace(api.ExportAPITemplate(), "package api", "package "+pkgName, 1)
	return util.WriteStringToFile(target, apiSnippet)
}
