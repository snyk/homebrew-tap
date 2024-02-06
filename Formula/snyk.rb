class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1277.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1277.0/snyk-macos"
    sha256 "ea61d2d42beaa7dc48411b1965f41fceec70d966d498b532f9eedb7f585074d6"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1277.0/snyk-macos-arm64"
    sha256 "8505bf2d34ab1c064b5bef0f5cc53ed8decfb7d7ebe8eb3f75984c8bbdd62a22"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1277.0/snyk-linux"
    sha256 "87f9f8344ed8a42e49b9e42a4c98bef8f005d9f8fb58f8b26d8ca63e5872a44c"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1277.0/snyk-linux-arm64"
    sha256 "d2ca349b3144f8055cd3d05568037160f3b362644d89c1bcf821ef5412307435"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
