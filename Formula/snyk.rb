class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.864.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.864.0/snyk-macos"
    sha256 "350b0b4b2509139bf8db404e3f5751a5397595c5594e06c4bea12f8fbe0eebdd"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.864.0/snyk-linux"
    sha256 "b94fba20c79747e9bea082fd23f2c582faf95f582fd737b65454894699732159"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
