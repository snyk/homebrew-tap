class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1240.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1240.0/snyk-macos"
    sha256 "655f979c706cd24397b2f5a4f81432b51242f308a53ca2deb876d6520ff04004"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1240.0/snyk-macos-arm64"
    sha256 "875e84a9085dfebed55b3ba90bd5853d0062edbcd9469746bddedba6a355ee4c"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1240.0/snyk-linux"
    sha256 "76ce4031899e1c642c723d26359daecd56d984c3c3777545af581d5427633284"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1240.0/snyk-linux-arm64"
    sha256 "c48a6ca4f9b5b9bce5dae81336097aed9f9f5994a1863fc9af8e5015615151ad"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
