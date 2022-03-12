class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.868.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.868.0/snyk-macos"
    sha256 "77e1dc38d199ff24a8c288de09e995dbaa6b679a6053f363398e919aa460f24a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.868.0/snyk-linux"
    sha256 "6e53d2c16897bdba240611b3b41cd9ff708901d293cb015584653a06373059bd"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
