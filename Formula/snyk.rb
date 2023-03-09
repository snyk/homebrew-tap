class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1116.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1116.0/snyk-macos"
    sha256 "48792f9c4b82dcef3c145e7b8947d420c9f3c8dba7927f06987e6b80b71914b0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1116.0/snyk-linux"
    sha256 "c46805ec8d403286b0a523bd4a4d7d76b708683d963edc14e856048af9625ca0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
