class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.910.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.910.0/snyk-macos"
    sha256 "f3b650f0c90de5b7c4d879ec015f5783644d095ea4af4502568f1961387229fb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.910.0/snyk-linux"
    sha256 "3cb1afe6fe55f7a8aaa52984b1b376c5b6e91c5ffff1d2affd2e684ab946cfa0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
