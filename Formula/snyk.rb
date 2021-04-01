class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.520.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.520.0/snyk-macos"
    sha256 "ab3167454e843fa75cd4dc9ffd2b9aaeab45d57d1e9648eab7f98fe264f84a7b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.520.0/snyk-linux"
    sha256 "34134fee84cb163ecf7fe967672b59305d37335fe60659c82bdab112654e6ee1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
