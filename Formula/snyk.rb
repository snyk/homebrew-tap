class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.961.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.961.0/snyk-macos"
    sha256 "46d8bab3fcb122dcb17e8c7b926af7ce35b138a641c01f9aede8922acfc01074"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.961.0/snyk-linux"
    sha256 "1c374b9e277276ae54da60cd574faa7dccdab6b4f844788ab01f04eac487714c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
