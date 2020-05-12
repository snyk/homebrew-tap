class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.320.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.320.2/snyk-macos"
    sha256 "fbb5d8f8fb610d6f1b12f63e7b5ede784a8be862d3b10b4b56359647e2f66112"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.320.2/snyk-linux"
    sha256 "4acf5e1f12daa20b2a6cc8a37caa17974e15515e35737b8923f5a615ad7c5f40"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
