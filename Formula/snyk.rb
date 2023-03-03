class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1111.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1111.0/snyk-macos"
    sha256 "66ebcc45043a2e1ec00c59c899e4460371a081570969b82909d1dcc2bd6b884f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1111.0/snyk-linux"
    sha256 "ea090a166ba94a16e5441035e371da3356ce899aaa073f57f03a59197f21010f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
