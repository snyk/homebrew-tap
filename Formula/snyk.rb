class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.366.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.366.2/snyk-macos"
    sha256 "f11473a156def38074b148bcbccabeb9107ef0f01587062d62c4e97bf69fc31c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.366.2/snyk-linux"
    sha256 "82e7a363c1ed85d89764a810f0dcb76baed45d15f783ffe692e439836a1f4f7e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
